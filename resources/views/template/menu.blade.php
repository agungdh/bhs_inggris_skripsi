<li>
  <a href="{{ route('pemakaian.index') }}">
    <i class="fa fa-calendar-check-o"></i> <span>Pemakaian</span>
  </a>
</li>

<li class="treeview">
  <a href="#">
    <i class="fa fa-database"></i>
    <span>Master</span>
    <span class="pull-right-container">
      <i class="fa fa-angle-left pull-right"></i>
    </span>
  </a>
  <ul class="treeview-menu">

    <li class="treeview">
      <a href="#">
        <i class="fa fa-users"></i>
        <span>Pegawai</span>
        <span class="pull-right-container">
          <i class="fa fa-angle-left pull-right"></i>
        </span>
      </a>
      <ul class="treeview-menu">
        
        <li>
          <a href="{{ route('pegawai.index') }}">
            <i class="fa fa-user"></i> <span>Pegawai</span>
          </a>
        </li>

        <li>
          <a href="{{ route('supir.index') }}">
            <i class="fa fa-user"></i> <span>Supir</span>
          </a>
        </li>

        <li>
          <a href="{{ route('petugasjaga.index') }}">
            <i class="fa fa-user"></i> <span>Petugas Jaga</span>
          </a>
        </li>

        <li>
          <a href="{{ route('fungsiumum.index') }}">
            <i class="fa fa-user"></i> <span>Fungi Umum</span>
          </a>
        </li>

      </ul>
    </li>

    <li>
      <a href="{{ route('bidangsektor.index') }}">
        <i class="fa fa-university"></i> <span>Bidang Sektor</span>
      </a>
    </li>

    <li>
      <a href="{{ route('kendaraan.index') }}">
        <i class="fa fa-car"></i> <span>Kendaraan</span>
      </a>
    </li>

    <li>
      <a href="{{ route('user.index') }}">
        <i class="fa fa-user"></i> <span>User</span>
      </a>
    </li>

  </ul>
</li>